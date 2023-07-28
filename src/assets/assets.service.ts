import { Injectable } from '@nestjs/common';
import { CreateAssetDto } from './dto/create-asset.dto';
import { UpdateAssetDto } from './dto/update-asset.dto';
import { DatabaseService } from 'src/database.service';

@Injectable()
export class AssetsService {
  constructor(private readonly dbService: DatabaseService) {}

  async create(createAssetDto: CreateAssetDto): Promise<any> {
    const assetColumns = [];
    const resourceColumns = [];
    const values = [];
    const assetParams = [];
    const resourceParams = [];
    let i = 1;

    // Loop through each property of the CreateAssetDto
    for (const [key, value] of Object.entries(createAssetDto)) {
      if (value !== null && value !== undefined) {
        if (
          key === 'itemBody' ||
          key === 'responseProcessing' ||
          key === 'metadata' ||
          key === 'markups' ||
          key === 'refAssetTypeId' ||
          key === 'markups' ||
          key === 'editorstate'
        ) {
          assetColumns.push(key);
          assetParams.push(`$${i}`);
        } else {
          resourceColumns.push(key);
          resourceParams.push(`$${i}`);
        }

        // Check if the property is metadata or markups
        if (key === 'metadata' || key === 'markups') {
          values.push(JSON.stringify(value));
        } else if (key == 'itemBody') {
          const newVal = `${value.replace(/&nbsp;/gim, '&#160;')}`;
          values.push(newVal);
        } else {
          values.push(value);
        }

        //params.push(`$${i}`);
        i++;
      }
    }

    // const queryString = `
    //   INSERT INTO assets (assetid, ${assetColumns.join(', ')})
    //   SELECT resourceid, ${assetParams.join(', ')}
    //   FROM (INSERT INTO resources (${resourceColumns.join(', ')})
    //         VALUES (${resourceParams.join(', ')})
    //         RETURNING *)
    //   RETURNING *`;

    const queryString = `
      WITH resource_insert AS (
        INSERT INTO resources (${resourceColumns.join(', ')})
        VALUES (${resourceParams.join(', ')})
        RETURNING *
      )
      INSERT INTO assets (assetid, ${assetColumns.join(', ')})
      SELECT resourceid, ${assetParams.join(', ')}
      FROM resource_insert
      RETURNING *;`;

    const result = await this.dbService.executeQuery(queryString, values);
    return result[0];
  }

  async findAll(page = 1, limit = 10, sort = 'AssetId', order = 'ASC') {
    const offset = (page - 1) * limit;

    const assets = await this.dbService.executeQuery(
      `SELECT * FROM assets JOIN resources ON assetid = resourceid ORDER BY ${sort} ${order} LIMIT ${limit} OFFSET ${offset}`,
    );

    const total = await this.dbService.executeQuery(
      'SELECT COUNT(1) FROM assets',
    );

    return {
      data: assets,
      page,
      limit,
      total: parseInt(total[0].count, 10),
    };
  }

  async findOne(id: number) {
    return await this.dbService.executeQuery('SELECT * FROM assets JOIN resources ON assetid = resourceid WHERE assetId = $1', [id]);
  }

  async update(id: number, updateAssetDto: UpdateAssetDto) {
    const updates = [];
    const values = [];
    let i = 1;

    for (const [key, value] of Object.entries(updateAssetDto)) {
      if (value !== null && value !== undefined) {
        updates.push(`${key} = $${i}`);

        // Check if the property is metadata or markups
        if (key === 'metadata' || key === 'markups') {
          values.push(JSON.stringify(value));
        } else {
          values.push(value);
        }

        i++;
      }
    }

    // Add the updatedOn timestamp to the updates and values arrays
    updates.push('updatedOn = clock_timestamp()');
    values.push(id);

    const queryString = `UPDATE assets SET ${updates.join(', ')} WHERE assetid = $${i} RETURNING *`;
    const result = await this.dbService.executeQuery(queryString, values);

    return result[0];
  }

  async remove(id: number): Promise<number> {
    const result = await this.dbService.executeNonQuery('DELETE FROM assets WHERE assetid = $1', [id]);
    const result1 = await this.dbService.executeNonQuery('DELETE FROM resources WHERE resourceid = $1', [id]);
    return result.rowCount;
  }
}

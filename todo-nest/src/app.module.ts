import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TodoModule } from './todo/todo.module';

import * as dotenv from 'dotenv'
import { TypeOrmModule } from '@nestjs/typeorm';

dotenv.config()
@Module({
  imports: [TodoModule, TypeOrmModule.forRoot({
    type: 'mysql',
    database: process.env.DB_NAME,
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT) || 3306,
    autoLoadEntities: true,
    synchronize: true,
    //entities: []
  })],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }

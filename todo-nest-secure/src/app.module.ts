import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TodoModule } from './todo/todo.module';

import * as dotenv from 'dotenv'
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserModule } from './user/user.module';
import { AuthorityModule } from './authority/authority.module';
import { RoleModule } from './role/role.module';
import { AuthModule } from './auth/auth.module';
import { JwtAuthGuard } from './jwt/jwt-auth.guard';
import { PassportModule } from '@nestjs/passport';
import { APP_GUARD } from '@nestjs/core';
import { ConfigModule, ConfigService } from '@nestjs/config';

import devConfiguration from '../configs/configuration.dev'
import prodConfiguration from '../configs/configuration.prod'
import { MulterModule } from '@nestjs/platform-express';

dotenv.config()
@Module({
  imports: [TodoModule,
    MulterModule.register({}),
    ConfigModule.forRoot({
      load: [process.env.ENV == 'DEV' ? devConfiguration : prodConfiguration],
      isGlobal: true,
    }),
    /* TypeOrmModule.forRoot({
      type: 'mysql',
      database: process.env.DB_NAME,
      username: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      host: process.env.DB_HOST,
      port: Number(process.env.DB_PORT) || 3306,
      autoLoadEntities: true,
      synchronize:
        true,
      //entities: []
    }), */
    TypeOrmModule.forRootAsync(
      {
        inject: [ConfigService],
        useFactory: (config: ConfigService) => ({
          type: 'mysql',
          host: config.get('database.host'),
          database: config.get('database.name'),
          username: config.get('database.username'),
          password: config.get('database.password'),
          port: Number(config.get('database.port')) || 3306,
          autoLoadEntities: true,
          synchronize:
            true,
        })
      }
    ),
    PassportModule.register({
      defaultStrategy: 'jwt'
    }),
    UserModule, AuthorityModule, RoleModule, AuthModule],
  controllers: [AppController],
  providers: [AppService, {
    provide: APP_GUARD,
    useClass: JwtAuthGuard
  },],
})
export class AppModule { }

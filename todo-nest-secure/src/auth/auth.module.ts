import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { JwtStrategyService } from 'src/jwt/jwt-strategy.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/user/entities/user.entity';
import { JwtModule, JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';


@Module({
  controllers: [AuthController],
  providers: [AuthService, JwtStrategyService],
  imports: [TypeOrmModule.forFeature([User]), JwtModule.registerAsync({
    inject: [ConfigService],
    global: true,
    useFactory: (configService: ConfigService) => ({
      secret: configService.get('jwt.secret'),
      signOptions: {
        expiresIn: 3000000
      }
    }),
  }),]

})
export class AuthModule { }

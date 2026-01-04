

import { Injectable, UnauthorizedException } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { InjectRepository } from "@nestjs/typeorm";
import { Strategy, ExtractJwt } from "passport-jwt";
import { User } from "src/user/entities/user.entity";
import { Repository } from "typeorm";
import * as dotenv from 'dotenv'
import { JwtPayload } from "./jwt-payload";
import { ConfigService } from '@nestjs/config';
@Injectable()
export class JwtStrategyService extends PassportStrategy(Strategy) {

    constructor(@InjectRepository(User) readonly userRepository: Repository<User>, private configService: ConfigService) {
        //const secretOrKey = process.env.JWT_SECRET;
        super({
            jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
            secretOrKey: configService.get('jwt.secret')
        });
    }
    async validate(payload: JwtPayload) {
        const dbUser = await this.userRepository.findOne({
            where: {
                username: payload.username
            }
        })
        if (!dbUser)
            throw new UnauthorizedException('Token not valid!!!')
        const user = {}
        Object.assign(user, {
            username: dbUser.username,
            role: dbUser.role
        })
    }

}
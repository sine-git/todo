import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateAuthDto } from './dto/create-auth.dto';
import { UpdateAuthDto } from './dto/update-auth.dto';
import { LoginAuthDto } from './dto/login-auth.dto';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/user/entities/user.entity';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';
import * as dotenv from 'dotenv';
import { JwtPayload } from 'src/jwt/jwt-payload';
import { LoginResponeDto } from './dto/login-response.dto';

@Injectable()
export class AuthService {
  constructor(private jwtService: JwtService, @InjectRepository(User) readonly userRepository: Repository<User>) {

  }
  async login(loginAuthDto: LoginAuthDto) {
    const dbUser = await this.userRepository.findOne({
      where: {
        username: loginAuthDto.username
      }
    })
    if (!dbUser)
      throw new NotFoundException('Invalid credential !!')
    const hashedPassword = await bcrypt.hash(loginAuthDto.password, dbUser.salt);

    if (hashedPassword != dbUser.password)
      throw new NotFoundException('Invalid credential !!')

    const payload = {
      username: dbUser.username,
      email: dbUser.email,
      role: dbUser.role.key,
    }

    const accessToken = this.jwtService.sign(payload)
    const refreshToken = this.jwtService.sign(payload)
    return new LoginResponeDto(accessToken, refreshToken)
  }
}

import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

async function bootstrap() {

  const app = await NestFactory.create(AppModule);
  const configService = app.get(ConfigService)
  app.useGlobalPipes(new ValidationPipe({
    whitelist: true,
    transform: true,
  }),)
  app.enableCors({
    origin: "http://localhost:4200",
    methods: "GET,HEAD,POST,PATCH,PUT,DELETE,OPTIONS"
  })
  await app.listen(Number(configService.get("server.port")));
}
bootstrap();

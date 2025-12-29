import { PartialType } from '@nestjs/mapped-types';
import { CreateTodoDto } from './create-todo.dto';
import { IsBoolean, IsNumber, IsString } from 'class-validator';

export class UpdateTodoDto {
    @IsNumber()
    userId: number
    @IsString()
    title: string
    @IsBoolean()
    completed: boolean
}

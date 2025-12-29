import { OmitType } from "@nestjs/mapped-types";
import { Todo } from "../entities/todo.entity";
import { IsBoolean, IsNumber } from "class-validator";

export class CreateTodoDto {
    /* @IsNumber()
    id: number */
    @IsNumber()
    userId: number
    title: string
    @IsBoolean()
    completed: boolean



}

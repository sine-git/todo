import { IsBoolean, IsNumber } from "class-validator";
import { Column, DeleteDateColumn, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity('todo')
export class Todo {
    @PrimaryGeneratedColumn()
    @IsNumber()
    id: number

    @Column({ name: 'user_id' })
    @IsNumber()
    userId: number

    @Column({ name: 'title' })
    title: string

    @Column()
    @IsBoolean()
    completed: boolean


    @DeleteDateColumn({ name: 'deleted_at' })
    deletedAt: Date
}

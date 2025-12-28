import { Column, DeleteDateColumn, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity('todo')
export class Todo {
    @PrimaryGeneratedColumn()
    id: number

    @Column({ name: 'user_id' })
    userId: number

    @Column({ name: 'title' })
    title: string

    @Column()
    completed: boolean


    @DeleteDateColumn({ name: 'deleted_at' })
    deletedAt: Date
}

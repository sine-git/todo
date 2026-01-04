import { Role } from "src/role/entities/role.entity";
import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";

@Entity('user')
export class User {

    @PrimaryGeneratedColumn()
    id: number

    @Column({ name: 'username' })
    username: string;

    @Column({ name: 'email' })
    email: string;

    @Column({ name: 'password' })
    password: string;

    @Column({ name: 'salt' })
    salt: string;

    @ManyToOne(() => Role, role => role.users, { eager: true })
    @JoinColumn({
        name: 'role_id'
    })
    role: Role

}
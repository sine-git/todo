import { Authority } from "src/authority/entity/authority.entity";
import { User } from "src/user/entities/user.entity";
import { Column, Entity, ManyToMany, OneToMany, PrimaryGeneratedColumn } from "typeorm";

@Entity('role')
export class Role {
    @PrimaryGeneratedColumn()
    id: number

    @Column({ name: 'key' })
    key: string

    @Column({ name: 'name' })
    name: string

    @Column({ name: 'description' })
    description: string

    @ManyToMany(() => Authority, (authority) => authority.roles)
    authorities: Authority[];

    @OneToMany(() => User, user => user.role)
    users: User[];

}
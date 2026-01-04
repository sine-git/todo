import { Role } from "src/role/entities/role.entity";
import { Auth, Column, Entity, JoinTable, ManyToMany, PrimaryGeneratedColumn } from "typeorm";

@Entity('authority')
export class Authority {
    @PrimaryGeneratedColumn()
    id: number;
    @Column({ name: 'key' })
    key: string;
    @Column({ name: 'name' })
    name: string;
    @Column({ name: 'description' })
    description: string;

    @ManyToMany(() => Role, (role) => role.authorities
    )
    @JoinTable({
        name: 'role_authority',
        joinColumn: {
            name: 'role_id',
        },
        inverseJoinColumn: {
            name: 'authority_id',
        }
    })
    roles: Role[]

}
import { SetMetadata } from "@nestjs/common"

export const IS_PUBLIC = 'isPublic';
export const ROLES = 'roles'

export const Public = () => SetMetadata(IS_PUBLIC, true)
export const Role = (roles: string[]) => SetMetadata(ROLES, roles);
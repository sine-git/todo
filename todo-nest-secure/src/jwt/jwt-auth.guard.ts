import { ExecutionContext, ForbiddenException, Injectable } from "@nestjs/common";
import { Reflector } from "@nestjs/core";
import { AuthGuard } from "@nestjs/passport";
import { IS_PUBLIC, ROLES } from "./jwt-decorators";
import { Observable } from "rxjs";

@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt')
{
    constructor(private reflector: Reflector) {
        super();
    }
    handleRequest(err: any, user: any, info: any, context: ExecutionContext, status?: any) {
        const requiredRoles = this.reflector.getAllAndOverride<string[]>(ROLES, [context.getHandler(), context.getClass()]);
        if (!requiredRoles || requiredRoles.length == 0 || !requiredRoles.includes(user.role))
            throw new ForbiddenException("Unauthorized to access the resource")
        return user;
    }
    canActivate(context: ExecutionContext): boolean | Promise<boolean> | Observable<boolean> {
        const isPublic = this.reflector.getAllAndOverride<boolean>(IS_PUBLIC, [context.getClass(), context.getHandler()])
        if (isPublic)
            return true
        return super.canActivate(context);
    }
}
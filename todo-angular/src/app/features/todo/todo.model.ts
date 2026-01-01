export class TodoModel {
    constructor(public id?: number, public userId?: number, public title?: string, public completed: boolean = false) {
    }
}
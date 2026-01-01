export class TodoModel {
    constructor(public id?: number, public title?: string, public state: boolean = false) {
    }
}
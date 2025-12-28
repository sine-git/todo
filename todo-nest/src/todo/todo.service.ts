import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateTodoDto } from './dto/create-todo.dto';
import { UpdateTodoDto } from './dto/update-todo.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Todo } from './entities/todo.entity';
import { Repository } from 'typeorm';

@Injectable()
export class TodoService {

  constructor(@InjectRepository(Todo) private readonly todoRepository: Repository<Todo>) {

  }
  create(createTodoDto: CreateTodoDto) {
    return this.todoRepository.save(createTodoDto);
  }

  findAll() {
    return this.todoRepository.find();
  }

  async findOne(id: number) {
    const todo = await
      this.todoRepository.findOne({ where: { id: id } });
    if (!todo)
      return new NotFoundException("This Todo doesn\'t");
    return todo
  }

  async update(id: number, updateTodoDto: UpdateTodoDto) {
    const dtoRequest = Object.assign({
      id: id, ...updateTodoDto
    })
    const dbTodo = await this.todoRepository.preload({ ...dtoRequest })

    if (!dbTodo)
      throw new NotFoundException("Todo not found in database");
    return this.todoRepository.save(updateTodoDto);
  }

  async remove(id: number) {
    const deletedResult = await this.todoRepository.delete({ id: id });
    if (deletedResult.affected == 0)
      return new NotFoundException("Todo not found in database")
  }
}

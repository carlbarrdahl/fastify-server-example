import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn
} from "typeorm"


@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id?: number

  @Column()
  name?: string

  @Column()
  pass?: string

  @Column()
  email?: string

  @CreateDateColumn()
  created_at?: string

  @UpdateDateColumn()
  updated_at?: string
}

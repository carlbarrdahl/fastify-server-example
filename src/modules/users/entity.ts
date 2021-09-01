import {
  Entity,
  Unique,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn
} from "typeorm"


@Entity()
@Unique(["email"])
export class User {
  @PrimaryGeneratedColumn()
  id?: number

  @Column()
  name?: string

  @Column()
  pass?: string

  @Column({ name: 'email' })
  email?: string

  @CreateDateColumn()
  created_at?: string

  @UpdateDateColumn()
  updated_at?: string
}

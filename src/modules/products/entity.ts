import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn
} from "typeorm"

@Entity()
export class Product {
  @PrimaryGeneratedColumn("uuid")
  id: string = ""

  @Column()
  // https://stackoverflow.com/questions/67351411/what-s-the-difference-between-definite-assignment-assertion-and-ambient-declarat
  name!: string

  @Column()
  image: string = ""

  @Column()
  expires_in: number = 0

  @Column()
  unit: string = ""

  @CreateDateColumn()
  created_at: string = ""

  @UpdateDateColumn()
  updated_at: string = ""
}

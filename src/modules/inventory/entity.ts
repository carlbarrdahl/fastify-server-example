import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  ManyToOne,
  JoinColumn
} from "typeorm"
import { Product } from "../products/entity"

@Entity()
export class Inventory {
  @PrimaryGeneratedColumn("uuid")
  id: string = ""

  @ManyToOne(type => Product, { cascade: true })
  @JoinColumn()
  product: Product = new Product()

  @Column()
  quantity: number = 0

  @Column("date")
  expiry_date: string = ""

  @CreateDateColumn()
  created_at: string = ""

  @UpdateDateColumn()
  updated_at: string = ""
}

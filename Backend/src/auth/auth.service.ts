import { Injectable, BadRequestException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
  constructor(private prisma: PrismaService) {}

  async register(data: any) {
    // 1. Check if user already exists
    const existingUser = await this.prisma.user.findUnique({
      where: { email: data.email },
    });

    if (existingUser) {
      throw new BadRequestException('User already exists');
    }

    // 2. Hash the password
    const hashedPassword = await bcrypt.hash(data.password, 10);

    // 3. Create the user in PostgreSQL
    return this.prisma.user.create({
      data: {
        email: data.email,
        password: hashedPassword,
        fullName: data.fullName,
        isClient: data.isClient,
        isFreelancer: data.isFreelancer,
      },
    });
  }
}
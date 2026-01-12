import { IsEmail, IsString, IsBoolean, MinLength, IsOptional } from 'class-validator';

export class RegisterDto {
  @IsEmail({}, { message: 'Please provide a valid email address' })
  email: string;

  @IsString()
  @MinLength(6, { message: 'Password must be at least 6 characters long' })
  password: string;

  @IsString()
  fullName: string;

  @IsBoolean()
  isFreelancer: boolean;

  @IsBoolean()
  isClient: boolean;

  @IsString()
  @IsOptional()
  avatarUrl?: string;
}
import 'dotenv/config'; 
// Note the '@' in the import below
import { defineConfig, env } from '@prisma/config'; 

export default defineConfig({
  schema: 'prisma/schema.prisma',
  datasource: {
    url: env('DATABASE_URL'),
  },
});
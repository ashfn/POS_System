import express from 'express';
import { PrismaClient } from '@prisma/client';


export const prisma = new PrismaClient()

const app = express();
app.use(express.json())  

app.get('/products', (req, res) => {
    const products = prisma.products.findMany();
    res.send(JSON.stringify(products))
})

app.post('/product', (req, res) => {
    const json = req.body
    console.log(json)
    res.send("OK")
})

app.use('/static', express.static('public'))

app.listen(3000, () => {
    console.log(`Server running at http://localhost:3000`);
});
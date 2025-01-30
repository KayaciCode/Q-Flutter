const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const UsersSchema = require('./models/users.model');
require('dotenv').config();

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', (req, res) => {
res.send('Hello World');
})

app.post('/register', (req, res) => {

const user = new UsersSchema(req.body);

user.save().then((response) => {

return res.status(200).send({
    message: "successfully",
    data: response
});
}).catch((error) => {
  return  res.status(500).send({
        message: "failed",
        data: error
    });
});


app.post('/login', async (req, res) => {
  const user = await UsersSchema.findOne(req.body)
  if (!user) { return res.status(500).send({ message: 'User not found' }) }

  return res.status(200).send({message:"User found", data: user})

})




})

mongoose.connect(process.env.MONGO_URL).then(() => {
  console.log('Connected');
}).catch((err) => {
  console.log('Error connected', err);
});

const port = process.env.PORT || 3000;
const server = app.listen(port, (err) => {
  if (err) {
    console.log('err');
  } else {
    console.log('Server started, Port number %d', server.address().port);
  }
});
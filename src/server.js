// import express from 'express';
// import process from 'process';
// import console from 'console';

const express = require('express');
const app = express();

app.get('/health', (req, res) => res.send('Still working... on *my* machine 🧃'));

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});


const express = require('express')
const res = require('express/lib/response')
const actions = require('../methods/actions')
const router = express.Router()

router.get('/', (req,res) => {
    res.send('Hello world')
})

router.get('/dashboard', (req,res) => {
    res.send('Hello from dashboard')
})


router.post('/adduser', () => {
    
})

module.exports = router;
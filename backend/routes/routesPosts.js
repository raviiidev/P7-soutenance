const express = require('express')
const router = express.Router()

const auth = require('../middleware/auth')
const multer = require('../middleware/multer-config.js')

const postsCtrl = require('../controllers/posts')

try {
  router.get('/', auth, postsCtrl.getAllPosts)
  router.post('/', auth, multer, postsCtrl.createPost)
  router.put('/:id', auth, multer, postsCtrl.updatePost)
  router.delete('/:id', auth, postsCtrl.deletePost)

  router.get('/likes', auth, postsCtrl.getAllLikes)
  router.post('/:id/like', auth, postsCtrl.postLike)

  router.get('/:id/comments', auth, postsCtrl.getComments)
  router.post('/:id/comments', auth, multer, postsCtrl.createComment)
  router.put('/comments/:id', auth, multer, postsCtrl.updateComment)
  router.delete('/comments/:id', auth, postsCtrl.deleteComment)
} catch (error) {
  console.log(error)
}

module.exports = router

var express = require('express');
var router = express.Router();
const autorController = require('../controllers/autor.controller');
const postController = require('../controllers/post.controller');

// Define un nuevo enrutador para la API
const apiRouter = express.Router();

// Define las rutas para la API
apiRouter.post('/autor', autorController.createAutor);
apiRouter.get('/autor/:id_autor', autorController.getAutor);
apiRouter.get('/autor-posts/:id_autor', autorController.getAutorPost);

apiRouter.post('/post', postController.createPost);
apiRouter.get('/post/:id_post', postController.getPost);

// Usa el enrutador de la API bajo la ruta '/api'
router.use('/api', apiRouter);

module.exports = router;

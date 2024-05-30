const Post = require('../models/post.model');

const createPost = async (req, res, next) => {
    try {
        // Extraer los datos del cuerpo de la solicitud
        const { titulo, descripcion, categoria, id_autor } = req.body;

        // Insertar el post en la base de datos
        const [result] = await Post.createPost({ titulo, descripcion, categoria, id_autor });

        // Verificar si el post se insertó correctamente
        if (result.affectedRows !== 1) {
            return res.status(500).json({ error: 'Error al crear el post' });
        }

        // Responder con un mensaje de éxito y el ID del nuevo post
        res.status(201).json({ success: 'Post creado correctamente', id: result.insertId });
    } catch (err) {
        next(err); // Pasar los errores al middleware de manejo de errores
    }
};

const getPost = async (req, res, next) => {
    try {
        // Seleccionar el post por ID, incluyendo los datos del autor
        const [post] = await Post.selectPostWithAuthorById(req.params.id_post);

        // Verificar si el post existe
        if (!post) {
            return res.status(404).json({ error: 'Post no encontrado' });
        }

        // Responder con la información del post, incluyendo los datos del autor
        res.json(post);
    } catch (err) {
        // Manejo de errores
        res.status(500).json({ error: err.message });
    }
};

module.exports = {
    createPost,
    getPost,
};
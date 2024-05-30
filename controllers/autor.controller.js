const Autor = require('../models/autor.model');

const createAutor = async (req, res, next) => {
    try {

        // Insertar el autor en la base de datos
        const [result] = await Autor.createAutor(req.body);

        // Verificar si el autor se insertó correctamente
        if (result.affectedRows !== 1) {
            return res.status(500).json({ error: 'Error al crear el autor' });
        }

        // Responder con un mensaje de éxito y el ID del nuevo autor
        res.status(201).json({ success: 'Autor creado correctamente', id: result.insertId });
    } catch (err) {
        next(err); // Pasar los errores al middleware de manejo de errores
    }
};

const getAutor = async (req, res, next) => {
    try {
        // Seleccionar el autor por ID
        const [autor] = await Autor.selectAutorById(req.params.id_autor);

        // Verificar si el autor existe
        if (autor.length === 0) {
            return res.status(404).json({ fatal: 'Autor no encontrado' });
        }

        // Responder con la información del autor
        res.json(autor[0]);
    } catch (err) {
        // Manejo de errores
        res.status(500).json({ error: err.message });
    }
};

const getAutorPost = async (req, res, next) => {
    try {
        // Seleccionar todos los posts del autor por ID del autor
        const [posts] = await Autor.selectPostsByAutorId(req.params.id_autor);

        // Verificar si hay posts
        if (posts.length === 0) {
            return res.status(404).json({ fatal: 'No se encontraron posts para este autor' });
        }

        // Responder con la lista de posts
        res.json(posts);
    } catch (err) {
        // Manejo de errores
        res.status(500).json({ error: err.message });
    }
};

// Exportación de módulos
module.exports = {
    createAutor,
    getAutor, 
    getAutorPost
};
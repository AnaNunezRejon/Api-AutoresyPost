
const createPost = ({ titulo, descripcion, categoria, id_autor }) => {
    return db.query(`INSERT INTO post (titulo, descripcion, categoria, id_autor) VALUES (?, ?, ?, ?)`, [titulo, descripcion, categoria, id_autor]);
};

const selectPostById = (id_post) => {
    return db.query(`SELECT * FROM post WHERE id_post = ?`, [id_post]);
};

const selectPostWithAuthorById = async (id_post) => {
    const query = `
        SELECT post.*, autor.nombre AS nombre_autor, autor.apellido AS apellido_autor
        FROM post
        INNER JOIN autor ON post.id_autor = autor.id_autor
        WHERE post.id_post = ?
    `;
    return await db.query(query, [id_post]);
};

module.exports = {
    createPost,
    selectPostById,
    selectPostWithAuthorById
};
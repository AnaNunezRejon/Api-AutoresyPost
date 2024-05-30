
const createAutor = ({ nombre, email, imagen }) => {
    return db.query(`INSERT INTO autor (nombre, email, imagen) VALUES (?, ?, ?)`, [nombre, email, imagen]);
};

const selectAutorById = (id_autor) => {
    return db.query(`SELECT * FROM autor WHERE id_autor = ?`, [id_autor]);
};

const selectPostByAutorById = (id_autor) => {
    return db.query(`SELECT * FROM post WHERE id_autor = ?`, [id_autor]);
};

// Exportación de módulos
module.exports = {
    createAutor,
    selectAutorById,
    selectPostByAutorById
};
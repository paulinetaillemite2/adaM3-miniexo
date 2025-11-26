//créer le type : contrat de rendu EN GROS C'EST LA PAYLOAD
type TodoType = {
    id: number;
    todo: string; 
    completed: boolean;
    userId: number;
}

// créer type pour la réponse complète de l'API qui contient todos, total, skip, limit

type TodosResponseType = {
    todos: TodoType[];
    total: number;
    skip: number;
    limit: number;
}

// créer la fonction getTodosType() pour le retour de toute l'api
async function getTodosType(): Promise<TodosResponseType> {
    const response = await fetch("https://dummyjson.com/todos")
    if (!response.ok){
        throw new Error(`Erreur HTTP: ${response.status}`);
    }

    const data: TodosResponseType = await response.json();
    return data;
}

// créer la fonction getTodoType (id) pour une todo
async function getTodoType(id: number): Promise<TodoType> {
    const response = await fetch (`https://dummyjson.com/todos/${id}`)
    if (!response.ok){
        throw new Error(`Erreur HTTP: ${response.status}`);
    }

    const data: TodoType = await response.json();
    return data;
}

// test todos
async function testGetTodosType() {
    try {
        const result = await getTodosType();
        console.log("Réponse de l'API:", result);
        console.log("Nombre de todos:", result.todos.length);
        console.log("Premier todo:", result.todos[0]);
    } catch (error) {
        console.error("Erreur:", error);
    }
}

//testGetTodosType();

//test todo 
async function testTodoType(id: number) {
    try{
        const result = await getTodoType(id);
        console.log(result)
    }
    catch (error){
        console.error("Erreur:", error);
    }
}
testTodoType(3)
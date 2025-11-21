//créer l'interface : contrat de rendu EN GROS C'EST LA PAYLOAD
interface Todo {
    id: number;
    todo: string; 
    completed: boolean;
    userId: number;
}

// créer interface pour la réponse complète de l'API cqui contient todos, total ,skip, limit

interface TodosResponse {
    todos: Todo[];
    total: number;
    skip: number;
    limit: number;
}

// créer la fonction getTodos() pour le retour de toute l'api
async function getTodos(): Promise<TodosResponse> {
    const response = await fetch("https://dummyjson.com/todos")
    if (!response.ok){
        throw new Error(`Erreur HTTP: ${response.status}`);
    }

    const data: TodosResponse = await response.json();
    return data;
}

// créer la fonction getTodo (id) pour une todo
async function getTodo(id: number): Promise<Todo> {
    const response = await fetch (`https://dummyjson.com/todos/${id}`)
    if (!response.ok){
        throw new Error(`Erreur HTTP: ${response.status}`);
    }

    const data: Todo = await response.json();
    return data;
}

// Fonction de test pour voir la réponse (merci claude)
async function testGetTodos() {
    try {
        const result = await getTodos();
        console.log("Réponse de l'API:", result);
        console.log("Nombre de todos:", result.todos.length);
        console.log("Premier todo:", result.todos[0]);
    } catch (error) {
        console.error("Erreur:", error);
    }
}

// Décommenter la ligne suivante pour tester
testGetTodos();
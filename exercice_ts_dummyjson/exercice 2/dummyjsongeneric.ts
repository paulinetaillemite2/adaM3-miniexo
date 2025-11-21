//créer le type : contrat de rendu EN GROS C'EST LA PAYLOAD
type TodoType = {
    id: number;
    todo: string; 
    completed: boolean;
    userId: number;
}

//type générique pour la structure de réponse de l'API
// <T> = le type qu'on veut 
type ApiResponse<T> = {
    [key: string]: T[] | number; 
    total: number;
    skip: number;
    limit: number;
}

// fonction générique simple on  lui passe le type attendu <T> et la route
async function listDummy<T>(route: string): Promise<ApiResponse<T>> {
    const response = await fetch(`https://dummyjson.com/${route}`);
    
    if (!response.ok) {
        throw new Error(`Erreur HTTP: ${response.status}`);
    }

    const data = await response.json();
    return data as ApiResponse<T>;
}

// Test 
async function test() {
    try {
        //  on veut des <TodoType>
        const result = await listDummy<TodoType>('todos');
        
        console.log(`J'ai récupéré ${result.total} éléments.`);
        console.log(result['todos']); 

    } catch (error) {
        console.error("Erreur:", error);
    }
}

test();
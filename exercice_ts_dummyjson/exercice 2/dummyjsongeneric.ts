// Type générique pour les réponses de l'API DummyJSON
type ApiResponse<TItem, TKey extends string> = {
    [K in TKey]: TItem[];
} & {
    total: number;
    skip: number;
    limit: number;
}

//créer le type : contrat de rendu EN GROS C'EST LA PAYLOAD
type Todo = {
    id: number;
    todo: string; 
    completed: boolean;
    userId: number;
}

// Utiliser le type générique pour TodosResponse
type TodosResponse = ApiResponse<Todo, 'todos'>

// Types pour Users
type Coordinates = {
    lat: number;
    lng: number;
}

type Address = {
    address: string;
    city: string;
    state: string;
    stateCode: string;
    postalCode: string;
    coordinates: Coordinates;
    country: string;
}

type Hair = {
    color: string;
    type: string;
}

type Bank = {
    cardExpire: string;
    cardNumber: string;
    cardType: string;
    currency: string;
    iban: string;
}

type Company = {
    department: string;
    name: string;
    title: string;
    address: Address;
}

type UserCrypto = {
    coin: string;
    wallet: string;
    network: string;
}

type User = {
    id: number;
    firstName: string;
    lastName: string;
    maidenName: string;
    age: number;
    gender: string;
    email: string;
    phone: string;
    username: string;
    password: string;
    birthDate: string;
    image: string;
    bloodGroup: string;
    height: number;
    weight: number;
    eyeColor: string;
    hair: Hair;
    ip: string;
    address: Address;
    macAddress: string;
    university: string;
    bank: Bank;
    company: Company;
    ein: string;
    ssn: string;
    userAgent: string;
    crypto: UserCrypto;
    role: string;
}

// Utiliser le type générique pour UsersResponse
type UsersResponse = ApiResponse<User, 'users'>

async function listDummy<T>(route: string): Promise<T> {
    const response = await fetch(`https://dummyjson.com/${route}`);
    if (!response.ok) {
        throw new Error(`Erreur HTTP: ${response.status}`);
    }
    
    const data: T = await response.json();
    return data;
}


//
async function testListDummy() {
    try {
        const result = await listDummy<UsersResponse>('users');
        console.log("Résultat:", result);
        console.log("Nombre de users:", result.users.length);
    } catch (error) {
        console.error("Erreur:", error);
    }
}

testListDummy()
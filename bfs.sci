function bfs(node, adjList, visited, component)
    queue = []; 
    queue = [queue, node]; 
    visited(node) = %T; 
    component = [component, node]; 

    while ~isempty(queue)
        u = queue(1); 
        queue(1) = []; 
        neighbors = adjList{u}; 
        for v = neighbors
            if ~visited(v) then
                visited(v) = %T; 
                queue = [queue, v]; 
                component = [component, v]; 
            end
        end
    end
end

function components = findConnectedComponents(vertices, edges)
    adjList = cell(vertices, 1); 
    visited = zeros(1, vertices); 
    components = []; 

    for i = 1:size(edges, 1)
        u = edges(i, 1);
        v = edges(i, 2);
        adjList{u} = [adjList{u}, v];
        adjList{v} = [adjList{v}, u]; 
    end

    for i = 1:vertices
        if ~visited(i) then
            component = []; 
            bfs(i, adjList, visited, component); 
            components = [components; component]; 
        end
    end
end

clc;
disp("Connected Components using BFS");

vertices = input("Enter the number of vertices: ");
edgesCount = input("Enter the number of edges: ");
edges = [];
disp("Enter edges (u, v): ");
for i = 1:edgesCount
    u = input("Enter source vertex: ");
    v = input("Enter destination vertex: ");
    edges = [edges; u, v];
end

components = findConnectedComponents(vertices, edges);
disp("Connected Components:");
for i = 1:size(components, 1)
    disp("Component " + string(i) + ": " + string(components(i, :)));
end

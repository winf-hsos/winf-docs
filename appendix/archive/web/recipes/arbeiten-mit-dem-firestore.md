# Work with Firestore

## Elemente einmal oder in Echtzeit lesen

```javascript
// Einmaliges Lesen der Todos aus der Datenbank
getContentItems('todos', todosReady);

function todosReady(todoArray) {

}
```



```javascript
// Lesen und Erhalten von Echtzeit Updates, z.B. wenn neues Element hinzugefügt wurde
getContentItemsRealTime('todos', todosReady);

function todosReady(todoArray) {

}
```


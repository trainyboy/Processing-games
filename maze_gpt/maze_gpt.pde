int cols, rows;
int w = 20;
Cell[][] grid;
Cell current;
ArrayList<Cell> stack = new ArrayList<Cell>();

void setup() {
  size(400, 400);
  cols = floor(width / w);
  rows = floor(height / w);

  // Create grid
  grid = new Cell[cols][rows];
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      grid[i][j] = new Cell(i, j);
    }
  }

  current = grid[0][0];
}

void draw() {
  background(51);
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      grid[i][j].show();
    }
  }

  current.visited = true;
  current.highlight();

  // Step 1
  Cell next = current.checkNeighbors();
  if (next != null) {
    next.visited = true;

    // Step 2
    stack.add(current);

    // Step 3
    removeWalls(current, next);

    // Step 4
    current = next;
  } else if (!stack.isEmpty()) {
    current = stack.remove(stack.size() - 1);
  }
}

class Cell {
  int i, j;
  boolean[] walls = {true, true, true, true}; // top, right, bottom, left
  boolean visited = false;

  Cell(int i, int j) {
    this.i = i;
    this.j = j;
  }

  void show() {
    int x = i * w;
    int y = j * w;
    stroke(255);
    if (walls[0]) line(x, y, x + w, y);
    if (walls[1]) line(x + w, y, x + w, y + w);
    if (walls[2]) line(x + w, y + w, x, y + w);
    if (walls[3]) line(x, y + w, x, y);
    
    if (visited) {
      noStroke();
      fill(255, 0, 255, 100);
      rect(x, y, w, w);
    }
  }

  void highlight() {
    int x = i * w;
    int y = j * w;
    noStroke();
    fill(0, 0, 255, 100);
    rect(x, y, w, w);
  }

  Cell checkNeighbors() {
    ArrayList<Cell> neighbors = new ArrayList<Cell>();

    Cell top = (j > 0) ? grid[i][j - 1] : null;
    Cell right = (i < cols - 1) ? grid[i + 1][j] : null;
    Cell bottom = (j < rows - 1) ? grid[i][j + 1] : null;
    Cell left = (i > 0) ? grid[i - 1][j] : null;

    if (top != null && !top.visited) {
      neighbors.add(top);
    }
    if (right != null && !right.visited) {
      neighbors.add(right);
    }
    if (bottom != null && !bottom.visited) {
      neighbors.add(bottom);
    }
    if (left != null && !left.visited) {
      neighbors.add(left);
    }

    if (neighbors.size() > 0) {
      int r = floor(random(neighbors.size()));
      return neighbors.get(r);
    } else {
      return null;
    }
  }
}

void removeWalls(Cell a, Cell b) {
  int x = a.i - b.i;
  if (x == 1) {
    a.walls[3] = false;
    b.walls[1] = false;
  } else if (x == -1) {
    a.walls[1] = false;
    b.walls[3] = false;
  }

  int y = a.j - b.j;
  if (y == 1) {
    a.walls[0] = false;
    b.walls[2] = false;
  } else if (y == -1) {
    a.walls[2] = false;
    b.walls[0] = false;
  }
}

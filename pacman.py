#!/usr/bin/env python3
"""
Simple Pac-Man clone using curses
"""

import curses
import time

# Map symbols
WALL = '#'
DOT = '.'
PACMAN = 'C'
GHOST = 'G'
EMPTY = ' '

# Simple maze
MAZE = [
    "####################",
    "#..................#",
    "#.###.###..###.###.#",
    "#.#...#......#...#.#",
    "#.#.###.####.###.#.#",
    "#..................#",
    "#.###.#.####.#.###.#",
    "#....#....#....#...#",
    "####.###.#..#.###.##",
    "    #...........#   ",
    "####.###.#..#.###.##",
    "#....#....#....#...#",
    "#.###.#.####.#.###.#",
    "#..................#",
    "#.###.###..###.###.#",
    "#...#..........#...#",
    "###.###.####.###.###",
    "#..................#",
    "####################",
]


def main(stdscr):
    curses.curs_set(0)
    stdscr.nodelay(True)
    stdscr.timeout(100)

    # Parse maze
    pacman_pos = [1, 1]
    dots = []
    for y, row in enumerate(MAZE):
        for x, cell in enumerate(row):
            if cell == DOT:
                dots.append((y, x))
            elif cell == PACMAN:
                pacman_pos = [y, x]

    score = 0
    game_over = False

    while not game_over:
        stdscr.clear()

        # Draw maze
        for y, row in enumerate(MAZE):
            for x, cell in enumerate(row):
                if (y, x) in dots:
                    stdscr.addch(y, x, DOT)
                else:
                    stdscr.addch(y, x, cell)

        # Draw pacman
        stdscr.addch(pacman_pos[0], pacman_pos[1], 'C', curses.A_BOLD)

        # Draw score
        stdscr.addstr(20, 0, f"Score: {score}")

        # Get input
        key = stdscr.getch()

        if key == ord('q'):
            game_over = True
        elif key == curses.KEY_UP:
            pacman_pos[0] -= 1
        elif key == curses.KEY_DOWN:
            pacman_pos[0] += 1
        elif key == curses.KEY_LEFT:
            pacman_pos[1] -= 1
        elif key == curses.KEY_RIGHT:
            pacman_pos[1] += 1

        # Check wall collision
        if MAZE[pacman_pos[0]][pacman_pos[1]] == WALL:
            game_over = True

        # Eat dots
        if tuple(pacman_pos) in dots:
            dots.remove(tuple(pacman_pos))
            score += 10

        stdscr.refresh()
        time.sleep(0.05)

    stdscr.addstr(22, 0, f"Game Over! Final Score: {score}")
    stdscr.refresh()
    time.sleep(2)


if __name__ == "__main__":
    try:
        curses.wrapper(main)
    except Exception as e:
        print(f"Error: {e}")
        print("Try: pip install windows-curses")

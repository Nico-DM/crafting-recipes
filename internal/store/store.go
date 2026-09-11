package store

import (
	"log/slog"
	"os"
)

type Store struct {
	dir    string
	logger *slog.Logger
}

func New(dir string, logger *slog.Logger) (*Store, error) {
	if err := os.MkdirAll(dir, 0o755); err != nil {
		return nil, err
	}
	return &Store{
		dir:    dir,
		logger: logger,
	}, nil
}

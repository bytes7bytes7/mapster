## 0.1.0

- Change signature of `Mapster`'s `map` functions.
- Change algorithm of creating an `Mapper`'s ID.
- Replace `to<TO>` function with `To<TO>` class due to a bug.
- Replace `toType` with `to` in `Mapper`.
- Remove `toType` override from all `Mapper`'s inheritors.

## 0.0.1

- Create `Mapper` base class and its 9 inheritors.
- Create `Mapster` base class and its private implementation.
- Create `MapperNotRegistered` exception.
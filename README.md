```bash
[1] pry(main)> Wiki.count
   (3.4ms)  SELECT COUNT(*) FROM "wikis"
=> 789
[2] pry(main)> Wiki.all.map(&:title).count
  Wiki Load (1.7ms)  SELECT "wikis".* FROM "wikis"
=> 789
[3] pry(main)> Wiki.all.map(&:title).uniq.count
  Wiki Load (1.0ms)  SELECT "wikis".* FROM "wikis"
=> 755
[5] pry(main)> Wiki.all.map(&:path).uniq.count
  Wiki Load (1.0ms)  SELECT "wikis".* FROM "wikis"
=> 756
[6] pry(main)> Wiki.all.map(&:path).compact.count
  Wiki Load (1.0ms)  SELECT "wikis".* FROM "wikis"
=> 771
```



---
title: 配置需求
date: 2023-11-09
description: 本章对ChimeStack云平台运行所须的基本环境配置进行说明。
weight: 2
---

## 网络配置要求

#### 推荐网络配置

1. **千兆管理网**: 用于管控服务端和节点之间的数据传输，以及管控服务访问的网络
2. **万兆业务网**: 用于虚拟机之间的数据传输
3. **万兆存储网**: 用户存储服务的数据传输

#### 最小网络配置

1. **千兆管理网**: 用于管控服务端和节点之间的数据传输
2. **万兆业务网**+**存储网**: 用于虚拟机之间、及存储服务的数据传输

#### AllInOne网络配置

仅需要千兆管理网络，提供管理服务访问的网络

## 管理节点配置要求

| 配置  | 需求   | AllInOne  | 仅server  | mysql | influxdb | 管理10节点 | 管理100节点 |
| ---- | ----- | --------- | --------- | ----- | -------- | --------- | --------- |
| CPU     | 64位x86架构(支持Intel VT或AMD-V) | 最低2核，推荐4核以上 | 1核 | 2核 | 2核 | 2核 | 4核 |
| 内存     | 推荐DDR4以上 | 最低4GB, 推荐8GB以上 | 2GB | 2GB | 2GB | 2GB | 4GB | 
| 存储     | HDD或SSD | SSD, 80GB以上 | 20GB | 推荐SSD, 20GB | 40GB | | |

## 计算节点配置要求



Code can also be shown in a block element.

```
foo := "bar";
bar := "foo";
```

Code can also use syntax highlighting.

```go
func main() {
  input := `var foo = "bar";`

  lexer := lexers.Get("javascript")
  iterator, _ := lexer.Tokenise(nil, input)
  style := styles.Get("github")
  formatter := html.New(html.WithLineNumbers())

  var buff bytes.Buffer
  formatter.Format(&buff, style, iterator)

  fmt.Println(buff.String())
}
```

```
Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.
```

Inline code inside table cells should still be distinguishable.

| Language    | Code               |
|-------------|--------------------|
| Javascript  | `var foo = "bar";` |
| Ruby        | `foo = "bar"{`      |

----------------




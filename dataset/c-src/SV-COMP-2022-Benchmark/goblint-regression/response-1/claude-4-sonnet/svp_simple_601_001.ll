; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_601_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_601_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@x = global i32 1, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_601_001_isr_1(i8* %0) #0 !dbg !13 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !17, metadata !DIExpression()), !dbg !18
  %3 = load i32, i32* @x, align 4, !dbg !19
  %4 = icmp eq i32 %3, 1, !dbg !21
  br i1 %4, label %5, label %6, !dbg !22

5:                                                ; preds = %1
  br label %6, !dbg !23

6:                                                ; preds = %5, %1
  store i32 -1, i32* @x, align 4, !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_601_001_main() #0 !dbg !27 {
  %1 = load i32, i32* @x, align 4, !dbg !30
  %2 = icmp eq i32 %1, 1, !dbg !31
  %3 = zext i1 %2 to i32, !dbg !31
  %4 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %3), !dbg !32
  store i32 0, i32* @x, align 4, !dbg !33
  %5 = load i32, i32* @x, align 4, !dbg !34
  %6 = icmp eq i32 %5, 0, !dbg !35
  %7 = zext i1 %6 to i32, !dbg !35
  %8 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %7), !dbg !36
  store i32 1, i32* @x, align 4, !dbg !37
  ret i32 0, !dbg !38
}

declare i32 @assert(...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "x", scope: !2, file: !6, line: 2, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_601_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_601_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "svp_simple_601_001_isr_1", scope: !6, file: !6, line: 4, type: !14, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !DILocalVariable(name: "arg", arg: 1, scope: !13, file: !6, line: 4, type: !16)
!18 = !DILocation(line: 4, column: 37, scope: !13)
!19 = !DILocation(line: 7, column: 7, scope: !20)
!20 = distinct !DILexicalBlock(scope: !13, file: !6, line: 7, column: 7)
!21 = !DILocation(line: 7, column: 9, scope: !20)
!22 = !DILocation(line: 7, column: 7, scope: !13)
!23 = !DILocation(line: 9, column: 3, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !6, line: 8, column: 3)
!25 = !DILocation(line: 11, column: 5, scope: !13)
!26 = !DILocation(line: 12, column: 1, scope: !13)
!27 = distinct !DISubprogram(name: "svp_simple_601_001_main", scope: !6, file: !6, line: 14, type: !28, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{!7}
!30 = !DILocation(line: 16, column: 10, scope: !27)
!31 = !DILocation(line: 16, column: 12, scope: !27)
!32 = !DILocation(line: 16, column: 3, scope: !27)
!33 = !DILocation(line: 18, column: 5, scope: !27)
!34 = !DILocation(line: 19, column: 10, scope: !27)
!35 = !DILocation(line: 19, column: 12, scope: !27)
!36 = !DILocation(line: 19, column: 3, scope: !27)
!37 = !DILocation(line: 20, column: 5, scope: !27)
!38 = !DILocation(line: 22, column: 3, scope: !27)

; ModuleID = 'svp_simple_601_001.c'
source_filename = "svp_simple_601_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@x = global i32 1, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_601_001_isr_1(i8* %0) #0 !dbg !12 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !16, metadata !DIExpression()), !dbg !17
  %3 = load i32, i32* @x, align 4, !dbg !18
  %4 = icmp eq i32 %3, 1, !dbg !20
  br i1 %4, label %5, label %6, !dbg !21

5:                                                ; preds = %1
  br label %6, !dbg !22

6:                                                ; preds = %5, %1
  store i32 -1, i32* @x, align 4, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_601_001_main() #0 !dbg !26 {
  %1 = load i32, i32* @x, align 4, !dbg !29
  %2 = icmp eq i32 %1, 1, !dbg !30
  %3 = zext i1 %2 to i32, !dbg !30
  %4 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %3), !dbg !31
  store i32 0, i32* @x, align 4, !dbg !32
  %5 = load i32, i32* @x, align 4, !dbg !33
  %6 = icmp eq i32 %5, 0, !dbg !34
  %7 = zext i1 %6 to i32, !dbg !34
  %8 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %7), !dbg !35
  store i32 1, i32* @x, align 4, !dbg !36
  ret i32 0, !dbg !37
}

declare i32 @assert(...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "x", scope: !2, file: !3, line: 2, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_601_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "svp_simple_601_001_isr_1", scope: !3, file: !3, line: 4, type: !13, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DILocalVariable(name: "arg", arg: 1, scope: !12, file: !3, line: 4, type: !15)
!17 = !DILocation(line: 4, column: 37, scope: !12)
!18 = !DILocation(line: 7, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !12, file: !3, line: 7, column: 7)
!20 = !DILocation(line: 7, column: 9, scope: !19)
!21 = !DILocation(line: 7, column: 7, scope: !12)
!22 = !DILocation(line: 9, column: 3, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !3, line: 8, column: 3)
!24 = !DILocation(line: 11, column: 5, scope: !12)
!25 = !DILocation(line: 12, column: 1, scope: !12)
!26 = distinct !DISubprogram(name: "svp_simple_601_001_main", scope: !3, file: !3, line: 14, type: !27, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{!6}
!29 = !DILocation(line: 16, column: 10, scope: !26)
!30 = !DILocation(line: 16, column: 12, scope: !26)
!31 = !DILocation(line: 16, column: 3, scope: !26)
!32 = !DILocation(line: 18, column: 5, scope: !26)
!33 = !DILocation(line: 19, column: 10, scope: !26)
!34 = !DILocation(line: 19, column: 12, scope: !26)
!35 = !DILocation(line: 19, column: 3, scope: !26)
!36 = !DILocation(line: 20, column: 5, scope: !26)
!37 = !DILocation(line: 22, column: 3, scope: !26)

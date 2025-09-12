; ModuleID = 'svp_simple_506_001.c'
source_filename = "svp_simple_506_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @f() #0 !dbg !12 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !15, metadata !DIExpression()), !dbg !16
  %2 = load i32, i32* @glob, align 4, !dbg !17
  %3 = add nsw i32 %2, 1, !dbg !18
  store i32 %3, i32* %1, align 4, !dbg !16
  %4 = load i32, i32* @glob, align 4, !dbg !19
  %5 = add nsw i32 %4, 1, !dbg !20
  store i32 %5, i32* @glob, align 4, !dbg !21
  call void @exit(i32 0) #3, !dbg !22
  unreachable, !dbg !22
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_506_001_isr_1(i8* %0) #0 !dbg !23 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %3, metadata !29, metadata !DIExpression()), !dbg !30
  %4 = load i32, i32* @glob, align 4, !dbg !31
  %5 = add nsw i32 %4, 1, !dbg !32
  store i32 %5, i32* %3, align 4, !dbg !30
  %6 = load i32, i32* @glob, align 4, !dbg !33
  %7 = add nsw i32 %6, 1, !dbg !34
  store i32 %7, i32* @glob, align 4, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_506_001_main() #0 !dbg !37 {
  call void @f(), !dbg !40
  store i32 8, i32* @glob, align 4, !dbg !41
  ret i32 0, !dbg !42
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "glob", scope: !2, file: !3, line: 5, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_506_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{!"clang version 10.0.0 "}
!12 = distinct !DISubprogram(name: "f", scope: !3, file: !3, line: 8, type: !13, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "tmp", scope: !12, file: !3, line: 9, type: !6)
!16 = !DILocation(line: 9, column: 7, scope: !12)
!17 = !DILocation(line: 9, column: 13, scope: !12)
!18 = !DILocation(line: 9, column: 17, scope: !12)
!19 = !DILocation(line: 10, column: 10, scope: !12)
!20 = !DILocation(line: 10, column: 14, scope: !12)
!21 = !DILocation(line: 10, column: 8, scope: !12)
!22 = !DILocation(line: 13, column: 3, scope: !12)
!23 = distinct !DISubprogram(name: "svp_simple_506_001_isr_1", scope: !3, file: !3, line: 16, type: !24, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!27 = !DILocalVariable(name: "arg", arg: 1, scope: !23, file: !3, line: 16, type: !26)
!28 = !DILocation(line: 16, column: 37, scope: !23)
!29 = !DILocalVariable(name: "tmp", scope: !23, file: !3, line: 17, type: !6)
!30 = !DILocation(line: 17, column: 7, scope: !23)
!31 = !DILocation(line: 17, column: 13, scope: !23)
!32 = !DILocation(line: 17, column: 17, scope: !23)
!33 = !DILocation(line: 18, column: 8, scope: !23)
!34 = !DILocation(line: 18, column: 12, scope: !23)
!35 = !DILocation(line: 18, column: 7, scope: !23)
!36 = !DILocation(line: 21, column: 1, scope: !23)
!37 = distinct !DISubprogram(name: "svp_simple_506_001_main", scope: !3, file: !3, line: 23, type: !38, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{!6}
!40 = !DILocation(line: 28, column: 3, scope: !37)
!41 = !DILocation(line: 30, column: 8, scope: !37)
!42 = !DILocation(line: 31, column: 3, scope: !37)

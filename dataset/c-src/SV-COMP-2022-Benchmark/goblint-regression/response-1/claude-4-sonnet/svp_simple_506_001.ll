; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_506_001.c'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_506_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob = common global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @f() #0 !dbg !13 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !16, metadata !DIExpression()), !dbg !17
  %2 = load i32, i32* @glob, align 4, !dbg !18
  %3 = add nsw i32 %2, 1, !dbg !19
  store i32 %3, i32* %1, align 4, !dbg !17
  %4 = load i32, i32* @glob, align 4, !dbg !20
  %5 = add nsw i32 %4, 1, !dbg !21
  store i32 %5, i32* @glob, align 4, !dbg !22
  call void @exit(i32 0) #3, !dbg !23
  unreachable, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_506_001_isr_1(i8* %0) #0 !dbg !24 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %3, metadata !30, metadata !DIExpression()), !dbg !31
  %4 = load i32, i32* @glob, align 4, !dbg !32
  %5 = add nsw i32 %4, 1, !dbg !33
  store i32 %5, i32* %3, align 4, !dbg !31
  %6 = load i32, i32* @glob, align 4, !dbg !34
  %7 = add nsw i32 %6, 1, !dbg !35
  store i32 %7, i32* @glob, align 4, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_506_001_main() #0 !dbg !38 {
  call void @f(), !dbg !41
  store i32 8, i32* @glob, align 4, !dbg !42
  ret i32 0, !dbg !43
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "glob", scope: !2, file: !6, line: 5, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_506_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_506_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{!"clang version 10.0.0 "}
!13 = distinct !DISubprogram(name: "f", scope: !6, file: !6, line: 8, type: !14, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "tmp", scope: !13, file: !6, line: 9, type: !7)
!17 = !DILocation(line: 9, column: 7, scope: !13)
!18 = !DILocation(line: 9, column: 13, scope: !13)
!19 = !DILocation(line: 9, column: 17, scope: !13)
!20 = !DILocation(line: 10, column: 10, scope: !13)
!21 = !DILocation(line: 10, column: 14, scope: !13)
!22 = !DILocation(line: 10, column: 8, scope: !13)
!23 = !DILocation(line: 13, column: 3, scope: !13)
!24 = distinct !DISubprogram(name: "svp_simple_506_001_isr_1", scope: !6, file: !6, line: 16, type: !25, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !27}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!28 = !DILocalVariable(name: "arg", arg: 1, scope: !24, file: !6, line: 16, type: !27)
!29 = !DILocation(line: 16, column: 37, scope: !24)
!30 = !DILocalVariable(name: "tmp", scope: !24, file: !6, line: 17, type: !7)
!31 = !DILocation(line: 17, column: 7, scope: !24)
!32 = !DILocation(line: 17, column: 13, scope: !24)
!33 = !DILocation(line: 17, column: 17, scope: !24)
!34 = !DILocation(line: 18, column: 8, scope: !24)
!35 = !DILocation(line: 18, column: 12, scope: !24)
!36 = !DILocation(line: 18, column: 7, scope: !24)
!37 = !DILocation(line: 21, column: 1, scope: !24)
!38 = distinct !DISubprogram(name: "svp_simple_506_001_main", scope: !6, file: !6, line: 23, type: !39, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{!7}
!41 = !DILocation(line: 28, column: 3, scope: !38)
!42 = !DILocation(line: 30, column: 8, scope: !38)
!43 = !DILocation(line: 31, column: 3, scope: !38)

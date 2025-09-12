; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/LongCat-Large-32K-Chat/svp_simple_509_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_509_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common local_unnamed_addr global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @munge() local_unnamed_addr #0 !dbg !14 {
entry:
  %tmp = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @myglobal, align 4, !dbg !19
  %add = add nsw i32 %0, 1, !dbg !20
  store i32 %add, i32* %tmp, align 4, !dbg !18
  %1 = load i32, i32* %tmp, align 4, !dbg !21
  store i32 %1, i32* @myglobal, align 4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @isr_munge() local_unnamed_addr #0 !dbg !24 {
entry:
  %tmp = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load i32, i32* @myglobal, align 4, !dbg !27
  %add = add nsw i32 %0, 1, !dbg !28
  store i32 %add, i32* %tmp, align 4, !dbg !26
  %1 = load i32, i32* %tmp, align 4, !dbg !29
  store i32 %1, i32* @myglobal, align 4, !dbg !30
  ret void, !dbg !31
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_509_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !32 {
entry:
  %arg.addr = alloca i8*, align 8
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !36, metadata !DIExpression()), !dbg !37
  call void @isr_munge(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_509_001_main() local_unnamed_addr #0 !dbg !40 {
entry:
  call void @munge(), !dbg !43
  ret i32 0, !dbg !44
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !6, line: 3, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_509_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_509_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "munge", scope: !6, file: !6, line: 6, type: !15, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "tmp", scope: !14, file: !6, line: 7, type: !7)
!18 = !DILocation(line: 7, column: 7, scope: !14)
!19 = !DILocation(line: 7, column: 13, scope: !14)
!20 = !DILocation(line: 7, column: 21, scope: !14)
!21 = !DILocation(line: 8, column: 12, scope: !14)
!22 = !DILocation(line: 8, column: 11, scope: !14)
!23 = !DILocation(line: 11, column: 1, scope: !14)
!24 = distinct !DISubprogram(name: "isr_munge", scope: !6, file: !6, line: 12, type: !15, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DILocalVariable(name: "tmp", scope: !24, file: !6, line: 13, type: !7)
!26 = !DILocation(line: 13, column: 7, scope: !24)
!27 = !DILocation(line: 13, column: 13, scope: !24)
!28 = !DILocation(line: 13, column: 21, scope: !24)
!29 = !DILocation(line: 14, column: 12, scope: !24)
!30 = !DILocation(line: 14, column: 11, scope: !24)
!31 = !DILocation(line: 17, column: 1, scope: !24)
!32 = distinct !DISubprogram(name: "svp_simple_509_001_isr_1", scope: !6, file: !6, line: 19, type: !33, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!36 = !DILocalVariable(name: "arg", arg: 1, scope: !32, file: !6, line: 19, type: !35)
!37 = !DILocation(line: 19, column: 37, scope: !32)
!38 = !DILocation(line: 20, column: 3, scope: !32)
!39 = !DILocation(line: 22, column: 1, scope: !32)
!40 = distinct !DISubprogram(name: "svp_simple_509_001_main", scope: !6, file: !6, line: 25, type: !41, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DISubroutineType(types: !42)
!42 = !{!7}
!43 = !DILocation(line: 27, column: 3, scope: !40)
!44 = !DILocation(line: 28, column: 3, scope: !40)

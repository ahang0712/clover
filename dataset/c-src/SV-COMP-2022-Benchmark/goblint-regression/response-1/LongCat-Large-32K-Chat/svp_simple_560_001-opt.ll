; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/LongCat-Large-32K-Chat/svp_simple_560_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_560_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@data = common local_unnamed_addr global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @assume_abort_if_not(i32 %cond) local_unnamed_addr #0 !dbg !14 {
entry:
  %cond.addr = alloca i32, align 4
  store i32 %cond, i32* %cond.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cond.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %cond.addr, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.end, label %if.then, !dbg !21

if.then:                                          ; preds = %entry
  call void @abort() #4, !dbg !22
  unreachable, !dbg !22

if.end:                                           ; preds = %entry
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_560_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !25 {
entry:
  %arg.addr = alloca i8*, align 8
  %tmp = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @data, align 4, !dbg !33
  %add = add nsw i32 %0, 1, !dbg !34
  store i32 %add, i32* %tmp, align 4, !dbg !32
  %1 = load i32, i32* %tmp, align 4, !dbg !35
  store i32 %1, i32* @data, align 4, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_560_001_main() local_unnamed_addr #0 !dbg !38 {
entry:
  %i = alloca i32, align 4
  %tmp = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !42
  %call = call i32 (...) @__VERIFIER_nondet_int(), !dbg !43
  store i32 %call, i32* %i, align 4, !dbg !42
  %0 = load i32, i32* %i, align 4, !dbg !44
  %cmp = icmp sle i32 0, %0, !dbg !45
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !46

land.rhs:                                         ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !47
  %cmp1 = icmp slt i32 %1, 10, !dbg !48
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ], !dbg !49
  %land.ext = zext i1 %2 to i32, !dbg !46
  call void @assume_abort_if_not(i32 %land.ext), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !51, metadata !DIExpression()), !dbg !52
  %3 = load i32, i32* @data, align 4, !dbg !53
  %add = add nsw i32 %3, 1, !dbg !54
  store i32 %add, i32* %tmp, align 4, !dbg !52
  %4 = load i32, i32* %tmp, align 4, !dbg !55
  store i32 %4, i32* @data, align 4, !dbg !56
  ret i32 0, !dbg !57
}

declare i32 @__VERIFIER_nondet_int(...) local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "data", scope: !2, file: !6, line: 8, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_560_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_560_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "assume_abort_if_not", scope: !6, file: !6, line: 3, type: !15, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !7}
!17 = !DILocalVariable(name: "cond", arg: 1, scope: !14, file: !6, line: 3, type: !7)
!18 = !DILocation(line: 3, column: 30, scope: !14)
!19 = !DILocation(line: 4, column: 7, scope: !20)
!20 = distinct !DILexicalBlock(scope: !14, file: !6, line: 4, column: 6)
!21 = !DILocation(line: 4, column: 6, scope: !14)
!22 = !DILocation(line: 4, column: 14, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !6, line: 4, column: 13)
!24 = !DILocation(line: 5, column: 1, scope: !14)
!25 = distinct !DISubprogram(name: "svp_simple_560_001_isr_1", scope: !6, file: !6, line: 11, type: !26, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !28}
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !DILocalVariable(name: "arg", arg: 1, scope: !25, file: !6, line: 11, type: !28)
!30 = !DILocation(line: 11, column: 37, scope: !25)
!31 = !DILocalVariable(name: "tmp", scope: !25, file: !6, line: 13, type: !7)
!32 = !DILocation(line: 13, column: 5, scope: !25)
!33 = !DILocation(line: 13, column: 9, scope: !25)
!34 = !DILocation(line: 13, column: 13, scope: !25)
!35 = !DILocation(line: 14, column: 9, scope: !25)
!36 = !DILocation(line: 14, column: 7, scope: !25)
!37 = !DILocation(line: 17, column: 1, scope: !25)
!38 = distinct !DISubprogram(name: "svp_simple_560_001_main", scope: !6, file: !6, line: 19, type: !39, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{!7}
!41 = !DILocalVariable(name: "i", scope: !38, file: !6, line: 21, type: !7)
!42 = !DILocation(line: 21, column: 7, scope: !38)
!43 = !DILocation(line: 21, column: 11, scope: !38)
!44 = !DILocation(line: 22, column: 28, scope: !38)
!45 = !DILocation(line: 22, column: 25, scope: !38)
!46 = !DILocation(line: 22, column: 30, scope: !38)
!47 = !DILocation(line: 22, column: 33, scope: !38)
!48 = !DILocation(line: 22, column: 35, scope: !38)
!49 = !DILocation(line: 0, scope: !38)
!50 = !DILocation(line: 22, column: 3, scope: !38)
!51 = !DILocalVariable(name: "tmp", scope: !38, file: !6, line: 23, type: !7)
!52 = !DILocation(line: 23, column: 7, scope: !38)
!53 = !DILocation(line: 23, column: 11, scope: !38)
!54 = !DILocation(line: 23, column: 15, scope: !38)
!55 = !DILocation(line: 24, column: 9, scope: !38)
!56 = !DILocation(line: 24, column: 7, scope: !38)
!57 = !DILocation(line: 27, column: 3, scope: !38)

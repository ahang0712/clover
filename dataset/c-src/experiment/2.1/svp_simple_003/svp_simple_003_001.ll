; ModuleID = 'svp_simple_003_001.bc'
source_filename = "./svp_simple_003_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_003_001_global_flag = global i32 0, align 4
@svp_simple_003_001_global_flag1 = global i32 0, align 4
@svp_simple_003_001_global_var2 = common global i32 0, align 4
@svp_simple_003_001_global_var1 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_003_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  %9 = bitcast i32* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #3, !dbg !11
  %10 = bitcast i32* %2 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !11
  %11 = bitcast i32* %3 to i8*, !dbg !12
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #3, !dbg !12
  %12 = bitcast i32* %4 to i8*, !dbg !12
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #3, !dbg !12
  call void (...) @idlerun(), !dbg !13
  call void @disable_isr(i32 1), !dbg !14
  call void @disable_isr(i32 2), !dbg !15
  %13 = bitcast i32* %5 to i8*, !dbg !16
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #3, !dbg !16
  store i32 0, i32* %5, align 4, !dbg !17, !tbaa !18
  br label %14, !dbg !16

14:                                               ; preds = %25, %0
  %15 = load i32, i32* %5, align 4, !dbg !22, !tbaa !18
  %16 = icmp slt i32 %15, 10000, !dbg !23
  br i1 %16, label %19, label %17, !dbg !24

17:                                               ; preds = %14
  %18 = bitcast i32* %5 to i8*, !dbg !24
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #3, !dbg !24
  br label %28

19:                                               ; preds = %14
  %20 = load i32, i32* %5, align 4, !dbg !25, !tbaa !18
  %21 = icmp eq i32 %20, 9999, !dbg !26
  br i1 %21, label %22, label %24, !dbg !25

22:                                               ; preds = %19
  %23 = load volatile i32, i32* @svp_simple_003_001_global_var2, align 4, !dbg !27, !tbaa !18
  store i32 %23, i32* %3, align 4, !dbg !28, !tbaa !18
  br label %24, !dbg !29

24:                                               ; preds = %22, %19
  br label %25, !dbg !30

25:                                               ; preds = %24
  %26 = load i32, i32* %5, align 4, !dbg !31, !tbaa !18
  %27 = add nsw i32 %26, 1, !dbg !31
  store i32 %27, i32* %5, align 4, !dbg !31, !tbaa !18
  br label %14, !dbg !24, !llvm.loop !32

28:                                               ; preds = %17
  %29 = bitcast i32* %6 to i8*, !dbg !33
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %29) #3, !dbg !33
  store i32 10000, i32* %6, align 4, !dbg !34, !tbaa !18
  br label %30, !dbg !33

30:                                               ; preds = %41, %28
  %31 = load i32, i32* %6, align 4, !dbg !35, !tbaa !18
  %32 = icmp sgt i32 %31, 0, !dbg !36
  br i1 %32, label %35, label %33, !dbg !37

33:                                               ; preds = %30
  %34 = bitcast i32* %6 to i8*, !dbg !37
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %34) #3, !dbg !37
  br label %44

35:                                               ; preds = %30
  %36 = load i32, i32* %6, align 4, !dbg !38, !tbaa !18
  %37 = icmp eq i32 %36, 9999, !dbg !39
  br i1 %37, label %38, label %40, !dbg !38

38:                                               ; preds = %35
  %39 = load volatile i32, i32* @svp_simple_003_001_global_var2, align 4, !dbg !40, !tbaa !18
  store i32 %39, i32* %4, align 4, !dbg !41, !tbaa !18
  br label %40, !dbg !42

40:                                               ; preds = %38, %35
  br label %41, !dbg !43

41:                                               ; preds = %40
  %42 = load i32, i32* %6, align 4, !dbg !44, !tbaa !18
  %43 = add nsw i32 %42, -1, !dbg !44
  store i32 %43, i32* %6, align 4, !dbg !44, !tbaa !18
  br label %30, !dbg !37, !llvm.loop !45

44:                                               ; preds = %33
  call void @enable_isr(i32 1), !dbg !46
  %45 = bitcast i32* %7 to i8*, !dbg !47
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %45) #3, !dbg !47
  store i32 0, i32* %7, align 4, !dbg !48, !tbaa !18
  br label %46, !dbg !47

46:                                               ; preds = %57, %44
  %47 = load i32, i32* %7, align 4, !dbg !49, !tbaa !18
  %48 = icmp slt i32 %47, 10000, !dbg !50
  br i1 %48, label %51, label %49, !dbg !51

49:                                               ; preds = %46
  %50 = bitcast i32* %7 to i8*, !dbg !51
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %50) #3, !dbg !51
  br label %60

51:                                               ; preds = %46
  %52 = load i32, i32* %7, align 4, !dbg !52, !tbaa !18
  %53 = icmp eq i32 %52, 9999, !dbg !53
  br i1 %53, label %54, label %56, !dbg !52

54:                                               ; preds = %51
  %55 = load volatile i32, i32* @svp_simple_003_001_global_var1, align 4, !dbg !54, !tbaa !18
  store i32 %55, i32* %1, align 4, !dbg !55, !tbaa !18
  br label %56, !dbg !56

56:                                               ; preds = %54, %51
  br label %57, !dbg !57

57:                                               ; preds = %56
  %58 = load i32, i32* %7, align 4, !dbg !58, !tbaa !18
  %59 = add nsw i32 %58, 1, !dbg !58
  store i32 %59, i32* %7, align 4, !dbg !58, !tbaa !18
  br label %46, !dbg !51, !llvm.loop !59

60:                                               ; preds = %49
  %61 = bitcast i32* %8 to i8*, !dbg !60
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %61) #3, !dbg !60
  store i32 10000, i32* %8, align 4, !dbg !61, !tbaa !18
  br label %62, !dbg !60

62:                                               ; preds = %73, %60
  %63 = load i32, i32* %8, align 4, !dbg !62, !tbaa !18
  %64 = icmp sgt i32 %63, 0, !dbg !63
  br i1 %64, label %67, label %65, !dbg !64

65:                                               ; preds = %62
  %66 = bitcast i32* %8 to i8*, !dbg !64
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %66) #3, !dbg !64
  br label %76

67:                                               ; preds = %62
  %68 = load i32, i32* %8, align 4, !dbg !65, !tbaa !18
  %69 = icmp eq i32 %68, 9999, !dbg !66
  br i1 %69, label %70, label %72, !dbg !65

70:                                               ; preds = %67
  %71 = load volatile i32, i32* @svp_simple_003_001_global_var1, align 4, !dbg !67, !tbaa !18
  store i32 %71, i32* %2, align 4, !dbg !68, !tbaa !18
  br label %72, !dbg !69

72:                                               ; preds = %70, %67
  br label %73, !dbg !70

73:                                               ; preds = %72
  %74 = load i32, i32* %8, align 4, !dbg !71, !tbaa !18
  %75 = add nsw i32 %74, -1, !dbg !71
  store i32 %75, i32* %8, align 4, !dbg !71, !tbaa !18
  br label %62, !dbg !64, !llvm.loop !72

76:                                               ; preds = %65
  %77 = bitcast i32* %4 to i8*, !dbg !73
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %77) #3, !dbg !73
  %78 = bitcast i32* %3 to i8*, !dbg !73
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %78) #3, !dbg !73
  %79 = bitcast i32* %2 to i8*, !dbg !73
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %79) #3, !dbg !73
  %80 = bitcast i32* %1 to i8*, !dbg !73
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %80) #3, !dbg !73
  ret void, !dbg !73
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare void @idlerun(...) #1

declare void @disable_isr(i32) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_003_001_isr_1() #0 !dbg !74 {
  call void @enable_isr(i32 2), !dbg !75
  store volatile i32 999, i32* @svp_simple_003_001_global_var2, align 4, !dbg !76, !tbaa !18
  %1 = load volatile i32, i32* @svp_simple_003_001_global_flag, align 4, !dbg !77, !tbaa !18
  %2 = icmp eq i32 %1, 1, !dbg !78
  br i1 %2, label %3, label %4, !dbg !77

3:                                                ; preds = %0
  store volatile i32 999, i32* @svp_simple_003_001_global_var1, align 4, !dbg !79, !tbaa !18
  br label %9, !dbg !80

4:                                                ; preds = %0
  %5 = load volatile i32, i32* @svp_simple_003_001_global_flag1, align 4, !dbg !81, !tbaa !18
  %6 = icmp eq i32 %5, 2, !dbg !82
  br i1 %6, label %7, label %8, !dbg !81

7:                                                ; preds = %4
  store volatile i32 888, i32* @svp_simple_003_001_global_var1, align 4, !dbg !83, !tbaa !18
  br label %8, !dbg !84

8:                                                ; preds = %7, %4
  br label %9

9:                                                ; preds = %8, %3
  ret void, !dbg !85
}

; Function Attrs: nounwind uwtable
define void @svp_simple_003_001_isr_2() #0 !dbg !86 {
  call void (...) @idlerun(), !dbg !87
  store volatile i32 1, i32* @svp_simple_003_001_global_flag, align 4, !dbg !88, !tbaa !18
  ret void, !dbg !89
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_003_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_003")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_003_001_main", scope: !8, file: !8, line: 27, type: !9, scopeLine: 27, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_003_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_003")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 28, column: 3, scope: !7)
!11 = !DILocation(line: 29, column: 3, scope: !7)
!12 = !DILocation(line: 30, column: 3, scope: !7)
!13 = !DILocation(line: 31, column: 3, scope: !7)
!14 = !DILocation(line: 33, column: 3, scope: !7)
!15 = !DILocation(line: 34, column: 3, scope: !7)
!16 = !DILocation(line: 36, column: 8, scope: !7)
!17 = !DILocation(line: 36, column: 12, scope: !7)
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C/C++ TBAA"}
!22 = !DILocation(line: 36, column: 19, scope: !7)
!23 = !DILocation(line: 36, column: 21, scope: !7)
!24 = !DILocation(line: 36, column: 3, scope: !7)
!25 = !DILocation(line: 37, column: 9, scope: !7)
!26 = !DILocation(line: 37, column: 11, scope: !7)
!27 = !DILocation(line: 38, column: 17, scope: !7)
!28 = !DILocation(line: 38, column: 15, scope: !7)
!29 = !DILocation(line: 39, column: 5, scope: !7)
!30 = !DILocation(line: 40, column: 3, scope: !7)
!31 = !DILocation(line: 36, column: 36, scope: !7)
!32 = distinct !{!32, !24, !30}
!33 = !DILocation(line: 41, column: 8, scope: !7)
!34 = !DILocation(line: 41, column: 12, scope: !7)
!35 = !DILocation(line: 41, column: 28, scope: !7)
!36 = !DILocation(line: 41, column: 30, scope: !7)
!37 = !DILocation(line: 41, column: 3, scope: !7)
!38 = !DILocation(line: 42, column: 9, scope: !7)
!39 = !DILocation(line: 42, column: 11, scope: !7)
!40 = !DILocation(line: 43, column: 17, scope: !7)
!41 = !DILocation(line: 43, column: 15, scope: !7)
!42 = !DILocation(line: 44, column: 5, scope: !7)
!43 = !DILocation(line: 45, column: 3, scope: !7)
!44 = !DILocation(line: 41, column: 36, scope: !7)
!45 = distinct !{!45, !37, !43}
!46 = !DILocation(line: 47, column: 3, scope: !7)
!47 = !DILocation(line: 48, column: 8, scope: !7)
!48 = !DILocation(line: 48, column: 12, scope: !7)
!49 = !DILocation(line: 48, column: 19, scope: !7)
!50 = !DILocation(line: 48, column: 21, scope: !7)
!51 = !DILocation(line: 48, column: 3, scope: !7)
!52 = !DILocation(line: 49, column: 9, scope: !7)
!53 = !DILocation(line: 49, column: 11, scope: !7)
!54 = !DILocation(line: 50, column: 17, scope: !7)
!55 = !DILocation(line: 50, column: 15, scope: !7)
!56 = !DILocation(line: 51, column: 5, scope: !7)
!57 = !DILocation(line: 52, column: 3, scope: !7)
!58 = !DILocation(line: 48, column: 36, scope: !7)
!59 = distinct !{!59, !51, !57}
!60 = !DILocation(line: 53, column: 8, scope: !7)
!61 = !DILocation(line: 53, column: 12, scope: !7)
!62 = !DILocation(line: 53, column: 28, scope: !7)
!63 = !DILocation(line: 53, column: 30, scope: !7)
!64 = !DILocation(line: 53, column: 3, scope: !7)
!65 = !DILocation(line: 54, column: 9, scope: !7)
!66 = !DILocation(line: 54, column: 11, scope: !7)
!67 = !DILocation(line: 55, column: 17, scope: !7)
!68 = !DILocation(line: 55, column: 15, scope: !7)
!69 = !DILocation(line: 56, column: 5, scope: !7)
!70 = !DILocation(line: 57, column: 3, scope: !7)
!71 = !DILocation(line: 53, column: 36, scope: !7)
!72 = distinct !{!72, !64, !70}
!73 = !DILocation(line: 58, column: 1, scope: !7)
!74 = distinct !DISubprogram(name: "svp_simple_003_001_isr_1", scope: !8, file: !8, line: 60, type: !9, scopeLine: 60, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 61, column: 3, scope: !74)
!76 = !DILocation(line: 62, column: 34, scope: !74)
!77 = !DILocation(line: 64, column: 7, scope: !74)
!78 = !DILocation(line: 64, column: 38, scope: !74)
!79 = !DILocation(line: 65, column: 36, scope: !74)
!80 = !DILocation(line: 66, column: 3, scope: !74)
!81 = !DILocation(line: 66, column: 14, scope: !74)
!82 = !DILocation(line: 66, column: 46, scope: !74)
!83 = !DILocation(line: 67, column: 36, scope: !74)
!84 = !DILocation(line: 68, column: 3, scope: !74)
!85 = !DILocation(line: 69, column: 1, scope: !74)
!86 = distinct !DISubprogram(name: "svp_simple_003_001_isr_2", scope: !8, file: !8, line: 71, type: !9, scopeLine: 71, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 72, column: 3, scope: !86)
!88 = !DILocation(line: 73, column: 34, scope: !86)
!89 = !DILocation(line: 74, column: 1, scope: !86)
